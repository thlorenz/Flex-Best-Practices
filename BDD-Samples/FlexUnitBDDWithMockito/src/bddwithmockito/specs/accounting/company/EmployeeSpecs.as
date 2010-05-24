package bddwithmockito.specs.accounting.company
{
	import accounting.company.Employee;
	import accounting.interfaces.IBankAccount;

	import org.mockito.integrations.mock;

	import specutils.base.SpecificationsBase;


	public class EmployeeSpecs extends SpecificationsBase
	{
		public static function get contexts() : Array
		{
			return [
				initially,
				when_told_that_he_is_fired,
				when_bankaccount_is_connected_and_his_salary_is_1_dollar_paying_him,
				when_bankaccount_is_connected_and_his_salary_is_2_dollars_paying_him,
				when_bankaccount_is_not_connected_paying_him,
				];
		}

		protected var _bankAccount_Mock : IBankAccount;

		protected var _sut : Employee;

		override protected function context() : void
		{
			_bankAccount_Mock = mock(IBankAccount);

			_sut = new Employee(_bankAccount_Mock);
		}
	}
}
import bddwithmockito.specs.accounting.company.EmployeeSpecs;

import org.mockito.integrations.*;


class initially extends EmployeeSpecs
{

	[Test]
	public function should_not_have_been_paid() : void
	{
		the(_sut.wasPaid).shouldBeFalse;
	}

	[Test]
	public function should_not_have_been_fired() : void
	{
		the(_sut.wasFired).shouldBeFalse;
	}

	[Test]
	public function should_have_zero_salary() : void
	{
		the(_sut.salary).shouldEqual(0);
	}
}

class when_told_that_he_is_fired extends EmployeeSpecs
{
	override protected function because() : void
	{
		_sut.fire();
	}

	[Test]
	public function was_fired_should_return_true() : void
	{
		the(_sut.wasFired).shouldBeTrue;
	}
}

class Ctx_BankAccountIsConnected extends EmployeeSpecs
{
	override protected function context() : void
	{
		super.context();
		given(_bankAccount_Mock.isConnected).willReturn(true);
	}
}

class when_bankaccount_is_connected_and_his_salary_is_1_dollar_paying_him extends Ctx_BankAccountIsConnected
{
	private const SALARY : int = 1;

	override protected function context() : void
	{
		super.context();
		_sut.salary = SALARY;
	}

	override protected function because() : void
	{
		_sut.pay();
	}

	[Test]
	public function sets_wasPaid_to_true() : void
	{
		the(_sut.wasPaid).shouldBeTrue;

	}

	[Test]
	public function should_update_his_bank_account() : void
	{
		verify().that(_bankAccount_Mock.updateWithAmount(any()));
	}

	[Test]
	public function should_update_his_bankaccount_with_1_dollar() : void
	{
		verify().that(_bankAccount_Mock.updateWithAmount(SALARY));
	}
}

class when_bankaccount_is_connected_and_his_salary_is_2_dollars_paying_him extends Ctx_BankAccountIsConnected
{
	private const SALARY : int = 2;

	override protected function context() : void
	{
		super.context();
		_sut.salary = SALARY;
	}

	override protected function because() : void
	{
		_sut.pay();
	}

	[Test]
	public function sets_wasPaid_to_true() : void
	{
		the(_sut.wasPaid).shouldBeTrue;
	}

	[Test]
	public function should_update_his_bank_account() : void
	{
		verify().that(_bankAccount_Mock.updateWithAmount(any()));
	}

	[Test]
	public function should_update_his_bankaccount_with_2_dollars() : void
	{
		verify().that(_bankAccount_Mock.updateWithAmount(SALARY));
	}
}


class when_bankaccount_is_not_connected_paying_him extends EmployeeSpecs
{
	override protected function context() : void
	{
		super.context();
		given(_bankAccount_Mock.isConnected).willReturn(false);
	}

	override protected function because() : void
	{
		_sut.pay();
	}

	[Test]
	public function should_set_wasPaid_to_false() : void
	{
		the(_sut.wasPaid).shouldBeFalse;
	}

	[Test]
	public function should_not_update_the_bankaccount() : void
	{
		verify(never()).that(_bankAccount_Mock.updateWithAmount(any()));
	}
}















