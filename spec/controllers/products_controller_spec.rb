require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let!(:product) { create(:product) }

  describe 'GET #index' do
    let(:products) { create_list(:product, 30) }
    before { get :index }

    it 'populates an array of all products' do
      expect(assigns(:products)).to match_array(Product.all.first(25))
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end


  describe 'GET #show' do
    before { get :show, params: { id: product } }

    it 'assigns the requested product to @product' do
      expect(assigns(:product)).to eq product
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new product to @product' do
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'save new product in database' do
        expect { post :create, params: { product: attributes_for(:product) } }.to change(Product, :count).by(1)
      end

      it 'redirect to show view' do
        post :create, params: { product: attributes_for(:product) }
        expect(response).to redirect_to product_path(assigns(:product))
      end
    end

    context 'with invalid attributes' do
      it 'doesn\'t save the product' do
        expect { post :create, params: { product: attributes_for(:product_invalid) } }.to_not change(Product, :count)
      end

      it 're-render new view' do
        post :create, params: { product: attributes_for(:product_invalid) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'change product attributes' do
        patch :update, params: { id: product, product: { name: 'new name', price: 12.12 } }
        product.reload
        expect(product.name).to eq 'new name'
        expect(product.price).to eq 12.12
      end

      it 'redirects to the show view' do
        patch :update, params: { id: product, product: attributes_for(:product) }
        expect(response).to redirect_to product_path(assigns(:product))
      end
    end
  end

  describe 'PATCH #update' do
    context 'with invalid attributes' do
      it 'change product attributes' do
        patch :update, params: { id: product, product: { name: nil, price: nil } }
        product.reload
        expect(product.name).to eq product.name
        expect(product.price).to eq product.price
      end

      it 'redirects to the show view' do
        patch :update, params: { id: product, product: attributes_for(:product) }
        expect(response).to redirect_to product_path(assigns(:product))
      end
    end
  end

  describe 'GET #edit' do
    before { get :edit, params: { id: product } }

    it 'assigns a edit product to @product' do
      expect(assigns(:product)).to eq product
    end

    it 'render new view' do
      expect(response).to render_template :edit
    end
  end

  describe 'DELETE #destroy' do
    it 'delete product' do
      expect { delete :destroy, params: { id: product } }.to change(Product, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, params: { id: product }
      expect(response).to redirect_to products_path
    end
  end
end
