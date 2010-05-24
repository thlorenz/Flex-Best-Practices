package traditional.tests.accounting.company
{
	import accounting.company.Employee;
	import accounting.interfaces.IEmployee;
	import org.flexunit.assertThat;
	import org.flexunit.asserts.*;
	import org.hamcrest.object.equalTo;
	import traditional.fakes.BankAccountMock;

	/**
	 *
	 * @author tlorenz
	 * quoting from this nice tutorial (with comments added):
	 * http://www.insideria.com/2009/05/flashbuilder4-will-support-fle.html
	 *
	 * •	[Before] - Replaces the setup() method in FlexUnit 1 and allow using multiple methods. Supports async, timeout, order and ui attributes.
	 * 					- is executed before each test
	 *
	 * •	[After] - Replaces the teardown() method in FlexUnit 1 and allow using multiple methods. Supports async, timeout, order and ui attributes
	 * 					- is executed after each test
	 * 					- good unit tests should not need to undo anything after a test
	 *
	 * •	[BeforeClass] - allow running methods before test class. Supports order attribute.
	 * 					- is executed once before all tests
	 *
	 * •	[AfterClass] - allow running methods after test class. Supports order attribute.
	 * 					- is executed once after all tests
	 * 					- good unit tests should not need to undo anything after a test
	 */
	public class EmployeeTests
	{

		// This will be injected instead of a real BankAccount and allows verification of interaction.
		private var _bankAccount_Mock : BankAccountMock;

		// _sut is System Under Test (what I am testing - in this case Employee)
		// this naming convention is taken from the in depth book: "xUnit Test Patterns: Refactoring Test Code" 
		private var _sut : IEmployee;

		[Before]
		public function setup() : void
		{
			_bankAccount_Mock = new BankAccountMock();
			_sut = new Employee(_bankAccount_Mock);
		}

		[Test]
		public function Initially_WasPaid_IsFalse() : void
		{
			assertFalse(_sut.wasPaid);
		}

		[Test]
		public function Initially_WasFired_IsFalse() : void
		{
			assertFalse(_sut.wasFired);
		}

		[Test]
		public function Initially_Salary_IsZero() : void
		{
			assertThat(_sut.salary, equalTo(0));
		}

		[Test]
		public function WhenTold_ThatHeIsFired_WasFiredIsTrue() : void
		{
			_sut.fire();

			assertTrue(_sut.wasFired);
		}

		// The following Testnames follow the pattern suggested by Roy Osherove in his "The Art of UnitTesting"
		//
		// [Test]
		// public function Situation_Action_Result
		//
		// As can be seen further down, this can result in very verbose testnames when the situation is a little complex

		[Test]
		public function BankAccountIsConnected_Paying_SetsWasPaidToTrue() : void
		{
			_bankAccount_Mock.isConnected = true;

			_sut.pay();

			assertTrue(_sut.wasPaid);
		}

		[Test]
		public function BankAccountIsConnected_Paying_UpdatesBankAccount() : void
		{
			_bankAccount_Mock.isConnected = true;

			_sut.pay();

			assertTrue(_bankAccount_Mock.updateWithAmountWasCalled);
		}

		[Test]
		public function BankAccountIsNotConnected_Paying_SetsWasPaidToFalse() : void
		{
			_bankAccount_Mock.isConnected = false;

			_sut.pay();

			assertFalse(_sut.wasPaid);
		}

		[Test]
		public function BankAccountIsNotConnected_Paying_DoesNotUpdateBankAccount() : void
		{
			_bankAccount_Mock.isConnected = false;

			_sut.pay();

			assertFalse(_bankAccount_Mock.updateWithAmountWasCalled);
		}

		[Test]
		public function SalaryIs1DollarAndBankAccountIsConnected_Paying_UpdatesBankAccountWith1Dollar() : void
		{
			const SALARY : Number = 1;

			_sut.salary = SALARY;

			_bankAccount_Mock.isConnected = true;

			_sut.pay();

			assertThat(_bankAccount_Mock.updateWithAmountWasCalledWith, equalTo(SALARY));
		}

		[Test]
		public function SalaryIs2DollarsAndBankAccountIsConnected_Paying_UpdatesBankAccountWith2Dollars() : void
		{
			const SALARY : Number = 2;

			_sut.salary = SALARY;

			_bankAccount_Mock.isConnected = true;

			_sut.pay();

			assertThat(_bankAccount_Mock.updateWithAmountWasCalledWith, equalTo(SALARY));
		}
	}
}