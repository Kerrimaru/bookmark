class Login extends React.Component {
  handleLogin(e) {
    e.preventDefault();
    const token = document.head
      .querySelector("meta[name='csrf-token']")
      .getAttribute('content');
    // console.log('tkoen1: ', token);
    // console.log(
    //   '2: ',
    //   document.head
    //     .querySelector("meta[name='csrf-token']")
    //     .getAttribute('content')
    // );
    // console.log(
    //   '3: ',
    //   document.querySelector("meta[name='csrf-token']").getAttribute('content')
    // );

    // console.log('e: ', e);

    const userInfo = {
      user: {
        email: document.getElementById('email').value,
        password: document.getElementById('password').value
      }
    };
    console.log('info: ', userInfo);
    return window
      .fetch('http://localhost:3000/users/sign_in', {
        headers: {
          'Content-Type': 'application/json',
          Accept: 'application/json',
          'X-Requested-With': 'XMLHttpRequest',
          'X-CSRF-Token': token,
          credentials: 'same-origin'
        },
        credentials: 'include',
        method: 'POST',
        body: JSON.stringify(userInfo)

        // credentials: 'include',
        // method: 'POST',
        // data: userInfo,
        // dataType: 'json',
        // headers: {
        //     'Accept': 'application/json',
        //     'Content-Type': 'application/json',
        //   // 'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        //   'X-CSRF-TOKEN': token
        //   // 'Content-Type': 'application/x-www-form-urlencoded',
        // }
      })
      .then(res => {
        console.log('res: ', res);
        // return res;
        // this.props.changePage('edit');
        if (res) {
          console.log('horray, res!');
          return this.props.getBookmarks();
        }
      })
      .catch(error => console.error(error));

    // $.ajax({
    //  type: 'POST',
    //  url: 'http://localhost:3000/users/sign_in',
    //  dataType: 'json',
    //  data: userInfo,
    //  error: function (error) {
    //   console.log(error)
    //  },
    //  success: function (res) {
    //   that.props.changePage('edit')
    //   that.props.updateCurrentUser(res.email)
    //  },
    // })
  }

  render() {
    return (
      <div>
        <h2>Login</h2>
        <form>
          <input id='email' placeholder='email' />
          <input id='password' placeholder='password' />
          <button onClick={e => this.handleLogin(e)}>Submit</button>
        </form>
        <button onClick={() => this.props.changePage('signup')}>
          Sign Up!
        </button>
      </div>
    );
  }
}
