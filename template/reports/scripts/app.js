	var App = angular.module('datatableApp', [/*'datatables','datatables.bootstrap'*/]);

	App.controller('datatableCtrl', function ($scope, $http) {
		$scope.finishedHeader = false;
		$scope.dtColumns = [];
		$http.get('/template/reports/file/report1.json').success(function(data){
			$scope.dtColumns = data.columns;
			
			
		});
		
		$http.get('/template/reports/file/report1_data.json').success(function(data){
			$scope.reportData = data.data;
			
			
		});
		
		
		
	  
	});
	
	App.directive('myDatatable', function() {
		  function link(scope, element, attrs) {
		    scope.$watch('finishedHeader', function(val) {
		      if (val === true) {
		        var t = $(element).dataTable({
		          sDom: '<"clear">TlfCrtip',
		          tableTools: {
		        	  "sSwfPath": "/template/madmin/app/vendors/DataTables/extensions/TableTools/swf/copy_csv_xls_pdf.swf",
			            
		              "aButtons": [
		                  "copy",
		                  "print",
		                  {
		                      "sExtends":    "collection",
		                      "sButtonText": "Save",
		                      "aButtons":    [ "csv", "xls", "pdf" ]
		                  }
		              ]
		          },
		          columns: scope.$eval(attrs.aaColumns) 	  
		        });
		        
		        

		        // watch for any changes to our data, rebuild the DataTable
		        scope.$watch(attrs.aaData, function(value) {
		          var val = value || null;
		          if (val) {
		            t.fnClearTable();
		            t.fnAddData(scope.$eval(attrs.aaData));
		          }
		        });
		      }
		    });
		  }
		  return {
		    link: link
		  }
		})
		  .directive('generateDatatable', function() {
		    function link(scope, element, attrs) {
		      if (scope.$last) {
		        scope.$parent.finishedHeader = true;
		      }
		    }
		    return {
		      link: link
		    }
		  });