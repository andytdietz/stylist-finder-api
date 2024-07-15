require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)  # Assuming you have a fixture for users
    @client = clients(:one)  # Assuming you have a fixture for clients associated with the user
    @token = JWT.encode({ user_id: @user.id, exp: 24.hours.from_now.to_i }, Rails.application.credentials.fetch(:secret_key_base), "HS256")
  end

  test "index" do
    get "/clients.json", headers: { 'Authorization': "Bearer #{@token}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Client.count, data.length
  end

  test "show" do
    get "/clients/#{@client.id}.json", headers: { 'Authorization': "Bearer #{@token}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "username"], data.keys
  end

  test "update" do
    patch "/clients/#{@client.id}.json", params: { username: "Updated name" }, headers: { 'Authorization': "Bearer #{@token}" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["username"]
  end
end
