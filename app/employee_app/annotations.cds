using EmployeeOdataService as services from '../../srv/services';
using from '../../db/data-model';


// /* annotate services.Employee with @(
    
//     UI.LineItem:[{

//         $Type : 'UI.DataField',
//         Value : ID,
//     },{      
//         $Type : 'UI.DataField',
//         Value : firstName,
//     },
//     {      
//         $Type : 'UI.DataField',
//         Value : lastName,
//     },
    
//      {      
//         $Type : 'UI.DataField',
//         Value : email,
//     },
    
//     {      
//         $Type : 'UI.DataField',
//         Value : designation,
//     },]
    
// ); */

/*
annotate services.Employee with @(
UI.LineItem:[{
    $Type : 'UI.DataField',
    Value : ID
},{
    $Type : 'UI.DataField',
    Value : firstName
},
    {
    $Type : 'UI.DataField',
    Value : lastName
},
    {
    $Type : 'UI.DataField',
    Value : salary
},
 {
    $Type : 'UI.DataField',
    Value : designation
},
] */




annotate services.Employee with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : mobile,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : designation,
            Label : 'designation',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : address,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedAt,
        },
        {
            $Type : 'UI.DataField',
            Value : modifiedBy,
        },
        {
            $Type : 'UI.DataField',
            Value : salary,
            Label : 'salary',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Employee Details',
            ID : 'EmployeeDetails',
            Target : '@UI.FieldGroup#EmployeeDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Family members',
            ID : 'Familymembers',
            Target : 'familyMembers/@UI.LineItem#Familymembers',
        },
    ],
    UI.FieldGroup #EmployeeDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : mobile,
            },
            {
                $Type : 'UI.DataField',
                Value : salary,
                Label : 'salary',
            },
            {
                $Type : 'UI.DataField',
                Value : address,
            },
            {
                $Type : 'UI.DataField',
                Value : designation_code,
                Label : '{i18n>Designation}',
            },
            {
                $Type : 'UI.DataField',
                Value : status.name,
                Label : '{i18n>Status}',
            },
        ],
    },
);

annotate services.FamilyMembers with @(
    UI.LineItem #Familymembers : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : relationShip,
        },
        {
            $Type : 'UI.DataField',
            Value : salary,
        },
        {
            $Type : 'UI.DataField',
            Value : mobile,
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>FamilyMemberDetails}',
            ID : 'i18nFamilyMemberDetails',
            Target : '@UI.FieldGroup#i18nFamilyMemberDetails',
        },
    ],
    UI.FieldGroup #i18nFamilyMemberDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataField',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Value : mobile,
            },
            {
                $Type : 'UI.DataField',
                Value : relationShip,
            },
            {
                $Type : 'UI.DataField',
                Value : salary,
            },
        ],
    },
);

annotate services.Employee with {
    designation @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Designation',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : designation_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
        Common.Text : designation.name,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate services.Designation with {
    code @(
        Common.Text : name,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate services.Status with {
    name @Common.FieldControl : #ReadOnly
};

