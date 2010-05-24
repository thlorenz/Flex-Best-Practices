package specutils.runners
{
	import flash.utils.getQualifiedClassName;
	import mx.controls.Alert;
	import mx.utils.ObjectUtil;
	import flexunit.flexui.FlexUnitTestRunnerUI;
	import org.mockito.Mockito;


	/**
	 *
	 * Runs all contexts via its run method
	 * For example: <pre>
	 * private function get fakes() : Array
	 *	{
	 *		return [IBankAccount, IEmployee];
	 *	}
	 *
	 *	private function get allContexts() : Array
	 *	{
	 *		return [
	 *			EmployeeSpecs.contexts,
	 *			EmployerSpecs.contexts,
	 *			];
	 *	}
	 *
	 *	private function onCreationComplete() : void
	 *	{
	 *		new ContextsRunner()
	 *			.executeSpecs(allContexts, fakes);
	 *	}</pre>
	 *
	 * @author tlorenz
	 *
	 *
	 */
	public class ContextsRunner
	{
		private var _allContexts : Array = new Array();

		/**
		 *
		 * @param contextsCollection - collection of context arrays (see below)
		 * @param fakeClasses - classes that mockito should prepare
		 * <p>Each context collection contains an Array that itself contains Arrays of context classes. e.g. <code>[Employee.contexts, Employer.contexts]</code> where Employee.contexts is an Array of context classes
		 * e.g. <code>[when_fired, when_not_fired]</code>.
		 *  Each of these classes will have one or more specifications (<code>[Test]</code>s) that contain the actual assertions</p>
		 * <p>Optionally pass in the classes mockito needs to prepare ( e.g. [IInterface1, IInterface2]), so they can be mocked in your specs.
		 *	  If none are passed in, we assume that mockito is not used and thus don't initialize it</p>
		 */
		public function run(contextsCollection : Array, fakeClasses : Array = null) : void
		{
			addContextsToRunFrom(contextsCollection);

			if (fakeClasses != null)
			{
				runWithMockito(fakeClasses);
			}
			else
				runContexts();
		}

		private function runWithMockito(fakeClasses : Array) : void
		{
			_allContexts.push(dummy_context_to_initialize_mockito);

			new Mockito().prepareClasses(fakeClasses, runContexts, handleFailure);
		}

		private function get allContexts() : Array
		{
			_allContexts.sort(function(a : Class, b : Class) : int
				{
					return ObjectUtil.stringCompare(getQualifiedClassName(a), getQualifiedClassName(b))
				});

			return _allContexts;
		}

		private function addContextsContainedIn(contexts : Array) : void
		{
			for each (var context : Class in contexts)
				_allContexts.push(context);
		}

		private function addContextsToRunFrom(contextsCollection : Array) : void
		{
			for each (var contexts : Array in contextsCollection)
				addContextsContainedIn(contexts);
		}

		private function runContexts() : void
		{
			var testRunner : FlexUnitTestRunnerUI = new FlexUnitTestRunnerUI();
			testRunner.runWithFlexUnit4Runner(allContexts, "");
		}

		private function handleFailure() : void
		{
			var msg : String = "failed to prepare mockitos - tests will not run";

			trace(msg);
			Alert.show(msg, "Prepare Mocks Failure");
		}

	}
}


/**
 * This is class is included in the run contexts, to give mockito one test class which has the meta-tag that mockito looks for to initialize.
 * Alternatively we could put it on one of our context classes, but this is easier.
 * @author tlorenz
 */
[RunWith("org.mockito.integrations.flexunit4.MockitoClassRunner")]
class dummy_context_to_initialize_mockito
{

	[Test]
	public function safely_ignore_this_little_hack() : void
	{
	}
}