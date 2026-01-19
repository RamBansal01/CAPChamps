using { sap.cap.namespace1 as my } from '../db/schema';

service productshop
{
    @odata.draft.enabled // to enable create and edit button
    entity Product as
        projection on my.Product
        actions
        {
            action OrderProduct
            (
                @title : 'Product name'
                name : String,
                @title : 'Product Stock'
                stock : Integer
            );

            action addtocart
            (
                @title : 'Add to cart'
                name : String
            );

            action CreatePO
            (
                @title : 'Create Purchase Order'
                name : String
            );
        };

    entity Supplier as
        projection on my.Supplier;

    function MyFunction
    (
        name : String
    )
    returns String;

    action MyAction
    (
        name : String
    )
    returns String;
}
