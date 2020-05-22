import React from 'react'
class ArticlesList extends React.Component {
  constructor(props) {
    super(props);
    this.state = { articles: [] }
  };

  fetchArticles() {
    fetch('/api/v1/article')
      .then(response => response.json())
      .then(result => this.setState({
        articles: result,
        scope: 1
      }))
      this.loadMore = this.loadMore.bind(this);
  };

  componentDidMount() {
    this.fetchArticles();
  };

  loadMore() {
    this.setState(old => {
      return {scope: old.scope + 1}
    })
  }

  render () {
    return (
      <React.Fragment>
        <div className='sidebar_box'>
          <h4>{ I18n.t('web.welcome.index.last_articles') }</h4>
          <ul className='latest-posts'>
            { this.state.articles.slice(0, this.state.scope).map(article => (
              <li key={ article.id }>
                <span className='date'>
                  <em className='day'>{ new Date(article.created_at).toISOString().slice(8,10) }</em>
                  <em className='month'>{ new Date(article.created_at).toUTCString().slice(8, 11) }</em>
                </span>
                <div className='article_title'>
                  <a href="#">{ article.title }</a>
                </div>
                <div className='article_author'>
                  { I18n.t('web.welcome.index.author') }: { article.author.name }
                </div>
                <div className='article_short_description'>
                  { article.short_description.substr(0, 70) }...
                </div>
              </li>
            ))}
          </ul>
          <div>
            {
              this.state.scope < this.state.articles.length &&
              <button type='button' className="button" onClick={this.loadMore}>{ I18n.t('web.welcome.index.load_more') }</button>
            }
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default ArticlesList
