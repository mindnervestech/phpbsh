	var App = angular.module('datatableApp', ['schemaForm','mgcrea.ngStrap',
	                                          'schemaForm-datepicker', 'schemaForm-timepicker', 'schemaForm-datetimepicker'/*'datatables','datatables.bootstrap'*/]);

	App.controller('datatableCtrl', function ($scope, $http) {
		$scope.finishedHeader = false;
		$scope.dtColumns = [];
		/*$http.get('/template/reports/file/report1.json').success(function(data){
			$scope.dtColumns = data.columns;
			
			
		});
		
		$http.get('/template/reports/file/report1_data.json').success(function(data){
			$scope.reportData = data.data;
			
			
		});*/
		
		$scope.reportMDs = [];
		
		$scope.loadReportsMd = function () {
			$http.get('/webapp/reports/md').success(function(resp){
				console.log(resp);
				$scope.reportMDs = resp;
				$('#saved-report-tab a').click();
			});
		}
		
		$scope.loadReportsMdDummy = function () {
			$http.get('/template/reports/file/md.json').success(function(resp){
				console.log(resp);
				$scope.reportMDs = resp;
			});
		}
		
		$scope.loadReportsMd();
		
		$scope.reportTemplate = {
				jsonForm:{},
				jsonSchema:[],
				model:{}
				
		};
		
		$scope.showExcButton = false;
		$scope.isAnyActiveReport= false;
		$scope.showReport = function (report) {
			$scope.reportTemplate.jsonForm = report.jsonForm;
			$scope.reportTemplate.jsonSchema = report.jsonSchema;
			$scope.reportTemplate.model.id = report.id;
			$scope.showExcButton = true;
			$('#custom-search-tab a').click();
		}
		
		
		var renderers = $.extend(
                 $.pivotUtilities.renderers, 
                 $.pivotUtilities.d3_renderers
                 );
		for(var k in $.pivotUtilities.c3_renderers)
         renderers["C3 "+k] = $.pivotUtilities.c3_renderers[k];
             
		$scope.runReport = function () {
			$scope.isAnyActiveReport = false;
			$http.get('/webapp/report/run',{params:{filter:$scope.reportTemplate.model}}).success(function(data){
				console.log(data);
				$scope.reportData = data.data;
				$scope.dtColumns = data.columns;
				
				$("#pivot-table-output").pivotUI(data.data, {
					renderers: renderers,
				});
				$scope.isAnyActiveReport = true;
			});
		}
		
		
	  
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
