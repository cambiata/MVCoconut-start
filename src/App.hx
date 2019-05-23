import UserModel;

class App extends View {
	static final NON_VALID = Css.make({
		backgroundColor: 'red',
	});
	static final ROOT = Css.make({
		background: '#e8e8e8',
		padding: '2em',
		h1: {
			marginBottom: '1em',
		},
		nav: {
			display: 'flex',
			marginBottom: '40px',
			a: {
				display: 'block',
				marginLeft: '1em',
			}
		},
		header: {
			border: 'blue solid 1px',
		},
		footer: {
			backgroundColor: '#444',
			color: 'white',
		},
	});

	final appmodel = new AppModel();
	final usermodel = new UserModel();

	function render()
		'
		<div class={ROOT}>
			
			<header>
				<UserView  usermodel={usermodel}/>
			</header>
			
			<main>
				<p>Main {appmodel.test}</p>
				<button onclick={appmodel.test++}>Click me</button>
			</main>

			<input value={appmodel.text} style="background-color: ${isValid() ? 'white' : 'tomato'};" oninput=${appmodel.text = event.currentTarget.value}/>
			<h1>{appmodel.text}</h1>
			<p>Valid text: ${Std.string(isValid())} </p>
			
		</div>';

	function isValid()
		return appmodel.text.length > 3;

	function viewDidMount()
		window.onhashchange = () -> forceUpdate();
}

class UserView extends View {
	@:attribute var usermodel:UserModel;

	function render()
		'<div>
			<p>${Std.string(usermodel.fullname)}</p>
			<p>${Std.string(usermodel.user)}</p>
			<if {usermodel.user == null}>
				<button onclick=${usermodel.login('test', '123')}>Login</button>
			<else>
				<button onclick=${usermodel.logout()}>Logout {usermodel.fullname}</button>
			</if>
		</div>';
}
