const cds = require('@sap/cds');
class EmployeeODataService extends cds.ApplicationService{
init(){
const { Employee } = this.entities;
   this.before('UPDATE', Employee.drafts,async (req) => {
    debugger;
   });
    return super.init();
}


}

module.exports = EmployeeODataService;