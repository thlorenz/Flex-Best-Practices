package specutils.base
{
	import specutils.extensions.SpecificationExtensions;

	/**
	 * Acts as a base class for all specifications to help with BDD.
	 *
	 * @author tlorenz
	 */
	public class SpecificationsBase
	{

		protected var caughtError : Error;

		[Before]
		public function setup() : void
		{
			context();
			because();
		}


		/**
		 *
		 * @param actual the object whose value we are testing
		 * @return the actual object wrapped in a SpecificationExtensions class that adds methods like shouldEqual, shouldBeTrue, etc.
		 *
		 *<p> Example: <pre>the(age).shouldEqual(20);</pre></p>
		 */
		protected function the(actual : Object) : SpecificationExtensions
		{
			return new SpecificationExtensions(actual);
		}

		/**
		 * Sets up the context for the specs in the current class.
		 * <p>IMPORTANT: Always call <code>super.context();</code> when overriding this!</p>
		 *
		 *<p> This can be used in the main context to setup things that apply to all specs.
		 * Ideally at that point the dependencies should be prepared and the sut constructed.</p>
		 *
		 * <p>Any more specific setups should be done inside the current context class.
		 * Here we should setup things that are specific to the behavior we are testing.</p>
		 *
		 */
		protected function context() : void
		{
		}

		/**
		 * After the context has been setup and the sut is thus prepared, we act on it.
		 * e.g. we invoke a method, set a property or cause a dependency (mock) to interact with it.
		 * The results of this action (normally it should be only one) will then be checked inside the test methods.
		 *
		 */
		protected function because() : void
		{
		}

		/**
		 *
		 * This is a helper that allows to execute a piece of code that will most likely cause an error.
		 * After invoking it, we can examine the caughtError property to validate that the expected type
		 * of error was thrown and that the message contained what we expected.
		 *
		 * This approach is more flexible than putting a meta-tag for the expected error on the test method.
		 *
		 * @param func
		 * the function that will cause the error
		 *
		 */
		protected function catchError(func : Function) : void
		{
			try
			{
				func();
				caughtError = null;
			}
			catch (e : Error)
			{
				caughtError = e;
			}
		}
	}
}