namespace employee.model.db;


using { cuid,managed  } from '@sap/cds/common';

type CommonFields {
    firstName : String(40) @title : '{i18n>firstName}';
    lastName : String(40) @title : '{i18n>lastName}';
    address : String(300) @title : '{i18n>address}';
    mobile : String(13) @title : '{i18n>mobile}';
    salary: Decimal(10,2) @title : '{i18n>salary}';
    email: String(50) @title : '{i18n>email}';

}
entity Employees : CommonFields,cuid,managed{
 //   key employeeID : UUID;  
    salary : Decimal(10,2);
    designation: Association to Designations;
    //familyMembers:Association to many FamilyMembers on familyMembers.employee = $self;
  familyMembers:Composition of many FamilyMembers on familyMembers.employee = $self;
  status : Association to Status default 'DCT';
}

entity FamilyMembers : CommonFields,cuid,managed{
    //key FamilyMemId : UUID;
    relationShip : String @title : '{i18n>relationship}';
    employee: Association to Employees;//Managed association
//unmanaged
   // employeeID: String;
   // employeeDet: Association to Employees on employeeDet.ID = employeeID;//umnanaged association
    //2 steps process-first create id and associate
}
    entity Designations{
      key code : String;
          name : String;
    
}

entity Status{
    key code: String;
        name : String;
}
