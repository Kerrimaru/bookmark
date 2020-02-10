class Welcome extends React.Component {
  //   getInitialState() {
  //     return {
  //       page: 'login'
  //     };
  //   }
  constructor(props) {
    super(props);
    this.state = {
      page: 'login',
      bookmarks: this.getBookmarks(),
      user: ''
    };
  }

  changePage(newPage) {
    console.log('new page: ', newPage);
    this.setState({ page: newPage });
    // this.setState({ bookmarks: [] });
  }

  fetch(endpoint) {
    return window
      .fetch(endpoint)
      .then(response => response.json())
      .catch(error => console.log(error));
  }

  getBookmarks() {
    this.fetch('/bookmarks').then(bookmarks => {
      if (bookmarks.length) {
        console.log('bookmarks: ', bookmarks);
        this.setState({ bookmarks: bookmarks, user: bookmarks[0].user });

        // this.getBookmark(bookmarks[0].id);
      } else {
        this.setState({ bookmarks: [] });
      }
    });
    console.log('this: ', this);
  }

  composeEls() {
    if (this.state.bookmarks && this.state.bookmarks.length) {
      return (
        <div id='welcome-container'>
          <div id='index-head'>
            <div id='logout'>
              <p>Logout</p>
            </div>
            <div id='title-search'>
              <input
                type='text'
                name='search'
                id='search'
                placeholder='Search by title...'
              />
            </div>
            <div id='welcome'>
              <h2>Welcome, {this.state.user.name}</h2>
            </div>
          </div>
          <div id='bookmarks-list'>
            {this.state.bookmarks.map(b => {
              return (
                <div key={b.id} className='bookmark'>
                  <a href={b.url} target='_blank'>
                    <img src={b.screenshot} className='screenshot'></img>
                    <h4>{b.title}</h4>
                  </a>
                  <div className='bookmark-text'>
                    <Taglist tags={b.tags} />
                    <i className='far fa-edit' id='edit'></i>
                    <i className='far fa-trash-alt' id='delete'></i>
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      );
    } else {
      return <p>no bookmarks</p>;
    }
  }

  //   render() {
  //     switch (this.state.page) {
  //       case 'login':
  //         return (
  //           <div>
  //             <Login
  //               changePage={e => this.changePage(e)}
  //               getBookmarks={e => this.getBookmarks(e)}
  //               //   updateCurrentUser={e => this.updateCurrentUser(e)}
  //             />
  //             <Logout />
  //           </div>
  //         );
  //       case 'signup':
  //         return <Signup changePage={e => this.changePage(e)} />;
  //       case 'edit':
  //         return <Edit changePage={e => this.changePage(e)} />;
  //       // return (
  //       //   <div>
  //       //     <h1>Welcome!</h1>
  //       //     <p>{this.props.greeting}</p>
  //       //   </div>
  //       // );
  //     }
  //   }

  render() {
    const els = this.composeEls();
    return (
      <div>
        {this.state.bookmarks && this.state.bookmarks.length ? (
          els
        ) : (
          <p>no bookmarks</p>
        )}
      </div>
    );
  }
}
