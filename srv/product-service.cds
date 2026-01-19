using {sap.cap.namespace1 as my} from '../db/schema';

//@protocol: 'rest'
service productshop {
    entity Product  as projection on my.Product actions{
    action OrderProduct(
    name  : String  @title: 'Product name',
                stock : Integer @title: 'Product Stock'

    );

     action addtocart(
    name  : String  @title: 'Add to cart'
     );
     
    action CreatePO(
    name  : String  @title: 'Create Purchase Order'
                
    );
   

    };

    entity Supplier as projection on my.Supplier;

    function MyFunction(name: String) returns String;
    action   MyAction(name: String)   returns String;
}
