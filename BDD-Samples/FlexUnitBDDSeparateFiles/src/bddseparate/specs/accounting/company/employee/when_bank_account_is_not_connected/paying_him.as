package bddseparate.specs.accounting.company.employee.when_bank_account_is_not_connected
{
	import bddseparate.specs.accounting.company.employee.EmployeeSpecs;

	public class paying_him extends EmployeeSpecs
	{
		override protected function context() : void
		{
			super.context();
			_bankAccount_Mock.isConnected = false;
		}

		override protected function because() : void
		{
			_sut.pay();
		}

		[Test]
		public function was_paid_should_be_false() : void
		{
			the(_sut.wasPaid).shouldBeFalse;
		}

		[Test]
		public function should_not_update_bankaccount() : void
		{
			the(_bankAccount_Mock.updateWithAmountWasCalled).shouldBeFalse;
		}
	}
}