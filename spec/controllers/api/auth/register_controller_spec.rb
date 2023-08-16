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
					message: "register success",
					user: User.last.as_json(only: [:name, :email, :username])
				)
			end
		end

		context 'when params are invalid' do
			let(:params) {
				{
					name: 'john doe',
					email: '',
					password: ''
				}
			}
			it 'returns 417' do
				subject
				expect(subject).to have_http_status(422)
				expect(response.body).to include_json(
					message: {
						email: ["can't be blank"],
						password: ["can't be blank"]
					}
				)  
			end
		end

	end
end