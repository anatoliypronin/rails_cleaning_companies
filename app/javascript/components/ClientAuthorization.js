import React from "react"
class ClientAuthorization extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      isVisible: false,
      phone: '',
      sms_code: '',
      isSmsSend: false
    };
    this.onToggle = this.onToggle.bind(this);
    this.handleChangePhone = this.handleChangePhone.bind(this);
    this.handleSubmitPhone = this.handleSubmitPhone.bind(this);
    this.handleChangeSmsCode = this.handleChangeSmsCode.bind(this);
    this.handleSubmitSmsCode = this.handleSubmitSmsCode.bind(this);
  }

  onToggle(e) {
    this.setState({isVisible: !this.state.isVisible});
  }

  handleChangePhone(event) {
    this.setState({phone: event.target.value});
  }

  handleChangeSmsCode(event) {
    this.setState({sms_code: event.target.value});
  }

  handleSubmitPhone(event) {
    event.preventDefault();

    fetch('/api/v1/client_session', {
      method: 'POST',
      headers: {'Content-type': 'application/json'},
      body: JSON.stringify({'client': {'phone_number': this.state.phone}})
    })
      .then(response => {if (response.ok) {this.setState({isSmsSend: true})}})

  }

  handleSubmitSmsCode(event) {
    event.preventDefault();

    fetch('/api/v1/client_session', {
      method: 'POST',
      headers: {'Content-type': 'application/json'},
      body: JSON.stringify({'client': {'phone_number': this.state.phone, 'sms_code': this.state.sms_code}})
    })
    .then(response => {if (response.ok) {window.location.href = '/'}})
  }

  render() {
    return (
      <React.Fragment>
        <a href='javascript:void(0)' onClick={this.onToggle}> { I18n.t('layouts.welcome.header.client_authorization') } </a>
          {this.state.isVisible &&
            <div className='popup'>
              <div className='form_container'>
                <form className='form_contact' onSubmit={this.state.isSmsSend ? this.handleSubmitSmsCode : this.handleSubmitPhone }>
                  <h3>{ I18n.t('layouts.welcome.header.client_authorization') }</h3>
                  {
                    !this.state.isSmsSend ?
                    <fieldset>
                      <input placeholder={ I18n.t('auth.phone_number') } value={this.state.phone} onChange={this.handleChangePhone} type="tel" required/>
                    </fieldset> :
                    <fieldset>
                      <input placeholder={ I18n.t('auth.sms_code') } value={this.state.sms_code} onChange={this.handleChangeSmsCode} type="text" required/>
                    </fieldset>
                  }
                  {
                    !this.state.isSmsSend ?
                    <fieldset>
                      <button name="submit" type="submit" className='form_button_submit'>{ I18n.t('auth.sms_send') }</button>
                    </fieldset> :
                    <fieldset>
                      <button name="submit" type="submit" className='form_button_submit'>{ I18n.t('auth.sms_accept') }</button>
                    </fieldset>
                  }
                  <fieldset>
                    <button name="submit" type="submit" className='form_button_cancel' onClick={this.onToggle} >{ I18n.t('auth.cancel') }</button>
                  </fieldset>
                </form>
              </div>
            </div>
          }
      </React.Fragment>
    );
  }
}

export default ClientAuthorization
