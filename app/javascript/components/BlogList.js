import React from "react"
import { Route, Link } from "react-router-dom";

class BlogList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { articles: [] }
  };

  fetchArticles() {
    fetch('/api/v1/article')
      .then(response => response.json())
      .then(result => this.setState({
        articles: result,
      }))
  };

  componentDidMount() {
    this.fetchArticles();
  };

  formatedDateDay(datetime) {
    return new Date(datetime).getDate();
  }

  formatedDateYear(datetime) {
    return new Date(datetime).getFullYear();
  }

  formatedDateMonth(datetime) {
    var date = new Date(datetime);
    return date.toLocaleString('en-US', { month: 'long' });
  }

  render () {
    return (
      <React.Fragment>
        { this.state.articles.map(article => (
          <div className="post">
            <div className="post-info">
              <div className="post-date">
                <span className="day">{ this.formatedDateDay(article.created_at) }</span>
                <span className="month">{ this.formatedDateMonth(article.created_at) }</span>
                <span className="year">{ this.formatedDateYear(article.created_at) }</span>
              </div>
              <div className="post-title">
                <h1><a href={"/blog/articles/" + article.id}>{ article.title }</a></h1>
              </div>
              <div className="post-author">
                { I18n.t('web.welcome.index.author') }: {article.author.name}
              </div>
            </div>
            <div className="post-text">
              <p>{ article.short_description }</p>
            </div>
          </div>
        ))}
      </React.Fragment>
    );
  }
}

export default BlogList
