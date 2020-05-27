import React from "react"
class StaticData extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      article_count: 0,
      service_count: 0,
      company_count: 0
    }
  };

  fetchArticlesCount() {
    fetch('/api/v1/article')
      .then(response => response.json())
      .then(result => this.setState({article_count: result.length}))
  };

  fetchServicesCount() {
    fetch('/api/v1/service')
      .then(response => response.json())
      .then(result => this.setState({service_count: result.length}))
  };

  fetchCompaniesCount() {
    fetch('/api/v1/company')
      .then(response => response.json())
      .then(result => this.setState({company_count: result.length}))
  };

  componentDidMount() {
    this.fetchArticlesCount();
    this.fetchServicesCount();
    this.fetchCompaniesCount();
  };

  render () {
    return (
      <React.Fragment>
        <div className='sidebar_box'>
          <h4>{ I18n.t('web.welcome.index.static_data') }</h4>
          <div className='static_box'>
            <p>{ I18n.t('web.welcome.index.services') }: {this.state.service_count}</p>
            <p>{ I18n.t('web.welcome.index.companies') }: {this.state.company_count} </p>
            <p>{ I18n.t('web.welcome.index.articles') }: {this.state.article_count} </p>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default StaticData
