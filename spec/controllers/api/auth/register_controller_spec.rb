describe Api::Auth::RegisterController, type: :controller do

	describe 'POST register' do

		subject { post :register, params: params }
		let(:params) {
			{
				name: 'john doe',
				email: 'email@test.com',
				date_birth: '1990-11-22',
			}
		}

		context 'when params are valid' do
			it 'returns 200' do
				subject
				expect(subject).to have_http_status(204)
				expect(response.body).to include_json(
					message: "begin verification",
					description: "signup_with_email",
					email: params[:email]
				)
			end
		end

	end
end