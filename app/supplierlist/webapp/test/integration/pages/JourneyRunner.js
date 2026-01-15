sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"supplierlist/test/integration/pages/SupplierList",
	"supplierlist/test/integration/pages/SupplierObjectPage"
], function (JourneyRunner, SupplierList, SupplierObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('supplierlist') + '/test/flp.html#app-preview',
        pages: {
			onTheSupplierList: SupplierList,
			onTheSupplierObjectPage: SupplierObjectPage
        },
        async: true
    });

    return runner;
});

