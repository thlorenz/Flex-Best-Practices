package bddseparate.specs.accounting.company.employee.when_bank_account_is_connected
{
	import bddseparate.specs.accounting.company.employee.EmployeeSpecs;

	public class Ctx_BankAccount_is_connected extends EmployeeSpecs
	{
		override protected function context() : void
		{
			// Make sure we build up onto the main context
			super.context();
			_bankAccount_Mock.isConnected = true;
		}
	}
}