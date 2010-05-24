package bddseparate.specs.accounting.company.employee
{
	import accounting.company.Employee;
	import bddseparate.fakes.BankAccountMock;
	import specutils.base.SpecificationsBase;

	public class EmployeeSpecs extends SpecificationsBase
	{
		protected var _bankAccount_Mock : BankAccountMock;
		protected var _sut : Employee;

		override protected function context() : void
		{
			_bankAccount_Mock = new BankAccountMock();
			_sut = new Employee(_bankAccount_Mock);
		}
	}
}