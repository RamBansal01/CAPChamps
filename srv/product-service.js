const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {
  const { Product } = srv.entities;

  srv.before('OrderProduct', async (req) => {

    console.log('Request Data:', JSON.stringify(req.data, null, 2));
    console.log('Request Params:', JSON.stringify(req.params, null, 2));

    const productId = req.params?.[0]?.ID;
    if (!productId) req.error(400, 'Product ID missing');

    const addQty = Number(req.data.quantity);
    if (!Number.isInteger(addQty) || addQty <= 0) {
      req.error(400, 'Invalid quantity. Quantity must be greater than 0');
    }

    const stockRow = await SELECT.one
      .from(Product)
      .columns('stock')
      .where({ ID: productId });

    if (!stockRow) req.error(404, 'Product not found');

    const currentStock = Number(stockRow.stock);
    const maxStock = 1500;
    const totalStock = currentStock + addQty;

    if (totalStock >= maxStock) {
      const allowedQty = Math.max(0, maxStock - currentStock);

      req.error(400, {
        code: 'STOCK_LIMIT_EXCEEDED',
        message: 'Stock limit exceeded',
        details: [
          {
            message: `You can add only ${allowedQty} more units. Current stock is ${currentStock}.`
          }
        ]
      });
    }

    req.context.productId = productId;
    req.context.addQty = addQty;
    req.context.currentStock = currentStock;
  });

  srv.on('OrderProduct', async (req) => {

    const { productId, addQty, currentStock } = req.context;
    const updatedStock = currentStock + addQty;

    // ✅ TRANSACTION-SAFE UPDATE (SQLite-friendly)
    const tx = cds.tx(req);

    const rows = await tx.run(
      UPDATE(Product)
        .set({ stock: updatedStock })
        .where({ ID: productId })
    );

    if (rows === 0) {
      req.error(500, 'Stock update failed');
    }
    
    req.notify({
      code: 'STOCK_UPDATED',
      message: `Order placed successfully. Updated stock is ${updatedStock}`
    });

    return {
      productId,
      currentStock,
      addedQuantity: addQty,
      totalStock: updatedStock
    };
    
  });
  
});
