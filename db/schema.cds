namespace sap.cap.namespace1;//done to diffenciate to application with same entities eg Product and Supplier

entity Product {
    key ID       : Integer;
        name     : String;
        price    : Integer;
        stock    : Integer;
        Category : Integer;
}

entity Supplier {
    key Name    : String;
        Address : String(100);
        Phone   : String(100);
        City    : String(100);
}
