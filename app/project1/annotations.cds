using productshop as service from '../../srv/product-service';
using from '../../db/schema';

annotate service.Product with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Carrier',
                Value : Carrier,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Labelflag',
                Value : Labelflag,
            },
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Category',
                Value : Category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Criticality',
                Value : Criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'supplier_ID',
                Value : supplier_ID,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'Product Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Supplier Information',
            ID : 'SupplierInformation',
            Target : '@UI.FieldGroup#SupplierInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Conversation',
            ID : 'Conversation',
            Target : 'conversation/@UI.LineItem#Conversation',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>ProductName}',
            Value : name,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : '{i18n>ProductCost}',
            @UI.Importance : #Medium,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : '{i18n>ProductStock}',
            @UI.Importance : #Medium,
        },
        {
            $Type : 'UI.DataField',
            Value : Labelflag,
            Label : '{i18n>SecurityLabels}',
            Criticality : Criticality,
            @UI.Importance : #Medium,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.Saveforlater',
            Label : '{i18n>SaveForLater}',
            Inline : true,
            Criticality : #Positive,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.OrderProduct',
            Inline : true,
            Label : '{i18n>ClickHereToOrder}',
            Criticality : #Positive,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.addtocart',
            Label : '{i18n>AddToCart}',
            Inline : true,
            Criticality : #Positive,
            @UI.Importance : #Low,
            IconUrl: 'sap-icon://border'
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.CreatePO',
            Label : '{i18n>CreatePurchaseOrder}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#Criticality',
            Label : '{i18n>5StarRating}',
        },
    ],
    UI.SelectionFields : [
        Category,
        name,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        TypeName : '',
        TypeNamePlural : '',
        Description : {
            $Type : 'UI.DataField',
            Value : supplier.name,
        },
        TypeImageUrl : 'sap-icon://customer-and-supplier',
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.OrderProduct',
            Label : '{i18n>OrderProduct}',
            Criticality : #Positive,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.addtocart',
            Label : '{i18n>AddToCart}',
            Determining : true,
            Criticality : #Positive,
        },
    ],
    UI.FieldGroup #SupplierInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : supplier.Address,
                Label : 'Address',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.City,
                Label : 'City',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.Phone,
                Label : 'Phone',
            },
        ],
    },
    UI.DataPoint #Criticality : {
        Value : Criticality,
        Visualization : #Rating,
        TargetValue : 5,
    },
    UI.DataPoint #stock : {
        Value : stock,
        Visualization : #Progress,
        TargetValue : 100,
    },
);

annotate service.Product with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Supplier',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Address',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'Phone',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'City',
            },
        ],
    }
};

annotate service.Product with {
    Category @Common.Label : 'Category'
};

annotate service.Product with {
    name @Common.Label : '{i18n>ProductName}'
};

annotate service.Product.conversation with @(
    UI.LineItem #Conversation : [
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.processor,
            Label : 'processor',
        },
        {
            $Type : 'UI.DataField',
            Value : up_.conversation.timestamp,
            Label : 'timestamp',
        },
    ]
);

annotate service.Supplier with {
    name @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Supplier',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : name,
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
)};

