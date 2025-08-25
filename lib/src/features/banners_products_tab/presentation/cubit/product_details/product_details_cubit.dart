import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/use_cases/get_product_details_use_case.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/cubit/product_details/products_Details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.getProductDetailsUseCase)
    : super(ProductDetailsState.initial());

  final GetProductDetailsUseCase getProductDetailsUseCase;

  void fetchProducts(String productId) async {
    emit(state.copyWith(productsStatus: BaseStatus.loading));
    final result = await getProductDetailsUseCase.call(productId);
    result.when(
      (success) => emit(
        state.copyWith(
          productsStatus: BaseStatus.success,
          productsBannerEntity: success,
        ),
      ),
      (error) => emit(
        state.copyWith(
          productsStatus: BaseStatus.error,
          productsDetailsErrorMessage: error.message,
        ),
      ),
    );
  }
}
