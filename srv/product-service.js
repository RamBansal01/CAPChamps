const cds = require('@sap/cds');
module.exports = cds.service.impl(async function (srv) {
  const { Product } = srv.entities;

  srv.before('OrderProduct', async (req) => {
    
    //console.log(req.data);
    //console.log(req.params);
    console.log('Request Data:', JSON.stringify(req.data, null, 2));
    console.log('Request Params:', JSON.stringify(req.params, null, 2));
    const productId = req.params[0].ID;
    console.log('ProductId:', productId);

  /* const result = await SELECT.one
  .from(Product)
  .columns('stock').where({ ID: req.params[0]});

    console.log('<< select query result', result)

    if (result[0].stock > 500){
      return req.error({
        code: '400',
        message: 'Enough stock available'
      })
      
    }*/
    
   /* Show DB content */   
  const result = await SELECT.from(Product);
  console.log('Product result:', result);


   const stockObj = await SELECT.one
   .from(Product)
   .columns('stock').where({ ID: productId });

  console.log('Stock for selected product :', stockObj);
  //console.log('Result :', stockObj[0].stock);

  const stock = Number(stockObj?.stock);


console.log('Stock (int):', stock);

if (stock >= 500) { return req.error(400, 'Enough stock available'); }

})
  

srv.on('OrderProduct', async (req) => {

 })
});