namespace sap.cap.namespace1;

using
{
    cuid,
    managed
}
from '@sap/cds/common';

aspect routeinfo
{
    Carrier : String;
    Labelflag : String;
}

entity Product : cuid, managed, routeinfo
{
    name : String;
    Category : Integer;
    price : Integer;
    stock : Integer;
    quantity : Integer;
    Criticality : Integer;
    supplier : Association to one Supplier;
    conversation: Composition of many{
        key ID: UUID;
        timestamp: String;
        processor: String;
        message: String;
    }
}

entity Supplier
{
    key ID : String;
    Address : String(100);
    name : String(100);
    Phone : String(100);
    City : String(100);
    products : Association to many Product on products.supplier = $self;
}
