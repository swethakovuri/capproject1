sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/app/employeeapp/test/integration/pages/EmployeeList",
	"com/app/employeeapp/test/integration/pages/EmployeeObjectPage"
], function (JourneyRunner, EmployeeList, EmployeeObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/app/employeeapp') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeeList: EmployeeList,
			onTheEmployeeObjectPage: EmployeeObjectPage
        },
        async: true
    });

    return runner;
});

