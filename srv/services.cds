using { employee.model.db  as dataModel} from '../db/data-model';


service EmployeeOdataService{
    
    @odata.draft.enabled
    entity Employee as projection on dataModel.Employees;
   entity Designation as projection on dataModel.Designations;
   entity Status as projection on dataModel.Status;
   // entity FamilyMembers as projection on dataModel.FamilyMembers;
   @readonly
    
        
    
}
