require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'unsuccessful edit' do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { email: 'foo@invalid',
                                              password:              'foo',
                                              password_confirmation: 'bar' } }

    assert_template 'users/edit'
    assert_select 'div.alert' ,'El formulario contiene 3 errores.'
    #assert_not flash.empty?

  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch user_path(@user), params: { user: { name:  name,
                                              email: email,
                                              password:              "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    #assert_equal name,  @user.name
    assert_equal email, @user.email
  end
end
