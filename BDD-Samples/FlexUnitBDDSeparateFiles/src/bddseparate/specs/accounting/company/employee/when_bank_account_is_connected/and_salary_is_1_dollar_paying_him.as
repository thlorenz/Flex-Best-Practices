package bddseparate.specs.accounting.company.employee.when_bank_account_is_connected
{

	public class and_salary_is_1_dollar_paying_him extends Ctx_BankAccount_is_connected
	{
		private const SALARY : Number = 1;

		override protected function context() : void
		{
			// make sure we call the context setup of Ctx_BankAccount_is_connected first
			super.context();
			_sut.salary = SALARY;
		}

		override protected function because() : void
		{
			_sut.pay();
		}

		[Test]
		public function should_set_was_paid_to_true() : void
		{
			the(_sut.wasPaid).shouldBeTrue;
		}

		[Test]
		public function should_update_the_bank_account() : void
		{
			the(_bankAccount_Mock.updateWithAmountWasCalled).shouldBeTrue;
		}

		[Test]
		public function should_update_the_bankaccount_with_1_dollar() : void
		{
			the(_bankAccount_Mock.updateWithAmountWasCalledWith).shouldEqual(SALARY);
		}


	}
}