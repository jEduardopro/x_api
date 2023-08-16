describe Api::Auth::RegisterController, type: :controller do

	describe 'POST register' do

		subject { post :register, params: params }
		let(:params) {
			{
				name: 'john doe',
				email: 'email@test.com',
				password: 'password'
			}
		}

		context 'when params are valid' do
			it 'returns 200' do
				subject
				expect(subject).to have_http_status(:ok)
				expect(response.body).to include_json(
					message: "begin verification",
					description: "signup_with_email",
					email: params[:email]
				)
			end
		end

	end
end