class UserModel implements Model {
	@:observable var user:User = null;

	@:transition function login(email:String, password:String) {
		return {
			user: {
				email: email,
				password: password,
				firstname: 'Bob',
				lastname: 'Hope'
			}
		};
	}

	@:transition function logout() {
		return {user: null};
	}

	@:computed var userStatus:String = 'USER-STATUS';
	@:computed var fullname:String = user != null ? user.firstname + ' ' + user.lastname : 'Anonymous';
}

typedef User = {
	var email(default, never):String;
	var password(default, never):String;
	var firstname(default, never):String;
	var lastname(default, never):String;
}
