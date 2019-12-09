class Welcome extends React.Component {
  //   getInitialState() {
  //     return {
  //       page: 'login'
  //     };
  //   }
  constructor(props) {
    super(props);
    this.state = {
      page: 'login'
    };
  }

  changePage(newPage) {
    console.log('new page: ', newPage);
    this.setState({ page: newPage });
    // this.setState({ bookmarks: [] });
  }

  render() {
    switch (this.state.page) {
      case 'login':
        return <Login changePage={e => this.changePage(e)} />;
      case 'signup':
        return <Signup changePage={e => this.changePage(e)} />;
      case 'edit':
        return <Edit changePage={e => this.changePage(e)} />;
      // return (
      //   <div>
      //     <h1>Welcome!</h1>
      //     <p>{this.props.greeting}</p>
      //   </div>
      // );
    }
  }
}
