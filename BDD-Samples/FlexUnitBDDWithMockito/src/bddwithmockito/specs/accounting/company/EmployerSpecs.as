package bddwithmockito.specs.accounting.company
{
	import accounting.company.Employer;
	import accounting.interfaces.IEmployee;

	import org.mockito.integrations.mock;

	import specutils.base.SpecificationsBase;

	public class EmployerSpecs extends SpecificationsBase
	{
		public static function get contexts() : Array
		{
			return [
				when_employee_did_good_work_and_is_evaluated,
				when_employee_did_no_good_work_and_is_evaluated,
				when_employee_has_salary_1_and_was_not_paid_but_was_fired_paying_him,
				when_employee_has_salary_1_but_was_paid_and_was_not_fired_paying_him,
				when_employee_has_salary_0_and_was_not_paid_and_was_not_fired_paying_him,
				when_employee_has_salary_1_and_was_not_paid_and_was_not_fired_paying_him
				];
		}

		protected var _employee_Mock : IEmployee;

		protected var _sut : Employer;

		override protected function context() : void
		{
			_employee_Mock = mock(IEmployee);

			_sut = new Employer(_employee_Mock);
		}
	}
}
import bddwithmockito.specs.accounting.company.EmployerSpecs;

import flash.errors.IllegalOperationError;

import org.mockito.integrations.given;
import org.mockito.integrations.never;
import org.mockito.integrations.verify;


class when_employee_did_good_work_and_is_evaluated extends EmployerSpecs
{
	override protected function context() : void
	{
		super.context();
		given(_employee_Mock.didGoodWork).willReturn(true);
	}

	override protected function because() : void
	{
		_sut.evaluateEmployee();
	}

	[Test]
	public function it_should_not_fire_him() : void
	{
		verify(never()).that(_employee_Mock.fire());
	}
}

class when_employee_did_no_good_work_and_is_evaluated extends EmployerSpecs
{
	override protected function context() : void
	{
		super.context();
		given(_employee_Mock.didGoodWork).willReturn(false);
	}

	override protected function because() : void
	{
		_sut.evaluateEmployee();
	}

	[Test]
	public function it_should_fire_him() : void
	{
		verify().that(_employee_Mock.fire());
	}
}

class when_employee_has_salary_1_and_was_not_paid_but_was_fired_paying_him extends EmployerSpecs
{
	override protected function context() : void
	{
		super.context();

		given(_employee_Mock.salary).willReturn(1);
		given(_employee_Mock.wasPaid).willReturn(false);
		given(_employee_Mock.wasFired).willReturn(true);
	}

	override protected function because() : void
	{
		catchError(function() : void
			{
				_sut.payEmployee()
			});
	}

	[Test]
	public function should_raise_an_IllegalOperationError() : void
	{
		the(caughtError).shouldBeInstanceOf(IllegalOperationError);
	}
}


class when_employee_has_salary_1_but_was_paid_and_was_not_fired_paying_him extends EmployerSpecs
{
	override protected function context() : void
	{
		super.context();

		given(_employee_Mock.salary).willReturn(1);
		given(_employee_Mock.wasPaid).willReturn(true);
		given(_employee_Mock.wasFired).willReturn(false);
	}

	override protected function because() : void
	{
		catchError(function() : void
			{
				_sut.payEmployee()
			});
	}

	[Test]
	public function it_should_not_pay_him_again() : void
	{
		verify(never()).that(_employee_Mock.pay());
	}
}

class when_employee_has_salary_0_and_was_not_paid_and_was_not_fired_paying_him extends EmployerSpecs
{
	override protected function context() : void
	{
		super.context();

		given(_employee_Mock.salary).willReturn(0);
		given(_employee_Mock.wasPaid).willReturn(false);
		given(_employee_Mock.wasFired).willReturn(false);
	}

	override protected function because() : void
	{
		catchError(function() : void
			{
				_sut.payEmployee()
			});
	}

	[Test]
	public function should_raise_an_IllegalOperationError() : void
	{
		the(caughtError).shouldBeInstanceOf(IllegalOperationError);
	}
}

class when_employee_has_salary_1_and_was_not_paid_and_was_not_fired_paying_him extends EmployerSpecs
{
	override protected function context() : void
	{
		super.context();

		given(_employee_Mock.salary).willReturn(1);
		given(_employee_Mock.wasPaid).willReturn(false);
		given(_employee_Mock.wasFired).willReturn(false);
	}

	override protected function because() : void
	{
		catchError(function() : void
			{
				_sut.payEmployee()
			});
	}

	[Test]
	public function it_should_pay_him() : void
	{
		verify().that(_employee_Mock.pay());
	}
}

