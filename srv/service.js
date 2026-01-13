const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {
    srv.on('printhelloworld', req => {
       console.log(req.data)// Print request coming from user
   })

    srv.on('addition',req =>{
        console.log(req.data)
        let result = req.data.num1 + req.data.num2;
        return result;
    })
    srv.on('Myfunction',req =>{

        let result = {}

        if (req.data.category ==1) {
            result.product = 'BMW',
            result.price = '$1200',
            result.location = 'New Delhi'
        }
        else {
            result.product = 'Creta',
            result.price = '$1000',
            result.location = 'Bengaluru'
        }
        console.log(result)
        return result;
            
    })
})