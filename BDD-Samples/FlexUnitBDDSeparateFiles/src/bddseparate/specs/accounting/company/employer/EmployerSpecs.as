package bddseparate.specs.accounting.company.employer
{
	import accounting.company.Employer;

	import bddseparate.fakes.EmployeeMock;

	import specutils.base.SpecificationsBase;

	public class EmployerSpecs extends SpecificationsBase
	{
		protected var _employee_Mock : EmployeeMock;

		protected var _sut : Employer;

		override protected function context() : void
		{
			_employee_Mock = new EmployeeMock();

			_sut = new Employer(_employee_Mock);
		}
	}
}