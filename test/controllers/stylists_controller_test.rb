require "test_helper"

class StylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  # Assuming you have a fixture for users
    @stylist = stylists(:one)  # Assuming you have a fixture for stylists associated with the user
    @token = JWT.encode({ user_id: @user.id, exp: 24.hours.from_now.to_i }, Rails.application.credentials.fetch(:secret_key_base), "HS256")
  end

  test "index" do
    get "/stylists.json", headers: { 'Authorization': "Bearer #{@token}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Stylist.count, data.length
  end

  test "show" do
    get "/stylists/#{@stylist.id}.json", headers: { 'Authorization': "Bearer #{@token}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["address1", "address2", "booking_url", "city", "facebook_url", "id", "instagram_url", "name", "state", "website", "zip"], data.keys.sort
  end

  test "update" do
    patch "/stylists/#{@stylist.id}.json", params: { name: "Updated name" }, headers: { 'Authorization': "Bearer #{@token}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end
end
