const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {

 //  srv.on('READ', 'Product', async (req) => {
   // console.log('<< I am at ON Handler');
//});

  // srv.before('READ', 'Product', async (req) => {
    //console.log('<< I am at before Handler');
//});

  // srv.after('READ', 'Product', async (req) => {
    //console.log('<< I am at after Handler');
//});


    srv.on('MyFunction', async (req) => {
        let result = `Super Cool ${req.data.name}`;
        return result;
    });

    srv.on('MyAction', async (req) => {
        let result = `Super Cool ${req.data.name}`;
        return result;
    });

});