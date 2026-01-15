namespace sap.cap.namespace1; //done to diffenciate to application with same entities eg Product and Supplier

using { cuid,managed } from '@sap/cds/common';

aspect routeinfo { //addition of extra values without defining in entity everytime

    Carrier   : String;
    Labelflag : String;

}

//aspect id {
// key ID : UUID; //> automatically filled in
//}

type pricestock { // done when we have price and stock same in multiple enteties : field = new field added
    price : Integer;
    stock : Integer;
}

entity Product : cuid, routeinfo,managed {
    //key ID       : UUID;
    name     : String;
    Category : Integer;
    Newfield : pricestock;

}

entity Supplier {
    key Name    : String;
        Address : String(100);
        Phone   : String(100);
        City    : String(100);
}
