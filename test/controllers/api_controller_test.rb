require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get getdatafromurl" do
    post api_getdatafromurl_url
    assert_response 400

    post api_getdatafromurl_url({"url" => 'http://dishantkaushik.me'})
    assert_response :success
  end

  test "should get geturls" do
    get api_geturls_url
    assert_response :success
  end

end
