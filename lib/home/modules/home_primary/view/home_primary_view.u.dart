import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:revup_core/core.dart';

import '../../../../l10n/l10n.dart';
import '../../../../router/router.dart';
import '../../../../shared/utils/utils_function.dart';
import '../../../../shared/widgets/default_avatar.dart';
import '../../../../shared/widgets/loading.u.dart';
import '../../../home.dart';
import '../cubit/home_primary_cubit.dart';
import '../widgets/card_service.u.dart';

class HomePrimaryView extends StatelessWidget {
  const HomePrimaryView({
    super.key,
    required this.user,
  });
  final AppUser user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final blocPage = context.watch<HomeBloc>();
    context.watch<HomePrimaryCubit>().state.whenOrNull(
          initial: (data) => context.read<HomePrimaryCubit>().onStarted(),
        );
    blocPage.state.maybeWhen(
      initial: () async {
        final isGranted = await requestUserLocation();
        if (!isGranted) {
          await context.router.push(const PermissionRoute());
        } else {
          final pos = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          blocPage
              .add(HomeEvent.started(lat: pos.latitude, lng: pos.longitude));
        }
      },
      orElse: () => false,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: BlocBuilder<HomePrimaryCubit, HomePrimaryState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<HomePrimaryCubit, HomePrimaryState>(
                    builder: (context, state) => state.maybeWhen(
                      orElse: Container.new,
                      loaded: (aUser, recentOrder, listService, listImgs) =>
                          AutoSizeText(
                        '${l10n.hiLabel}, ${aUser.firstName} ${aUser.lastName}',
                        style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold) ??
                            const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      recentOrderEmpty: (aUser, listService, listImgs) =>
                          AutoSizeText(
                        '${l10n.hiLabel}, ${aUser.firstName} ${aUser.lastName}',
                        style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold) ??
                            const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                        child: Icon(
                          const IconData(
                            0xe3ab,
                            fontFamily: 'MaterialIcons',
                          ),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 2,
                        child: AutoSizeText(
                          user.addr,
                          style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Expanded(
                        child: AutoSizeText(
                          l10n.operationStatusLabel,
                          style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(fontWeight: FontWeight.bold) ??
                              const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                          minFontSize: 5,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) => state.map(
                          initial: (_) => FlutterSwitch(
                            value: user.maybeMap(
                              provider: (value) {
                                return value.online;
                              },
                              orElse: () => false,
                            ),
                            width: 45,
                            height: 25,
                            activeColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            inactiveColor:
                                Theme.of(context).colorScheme.outline,
                            onToggle: (value) {
                              context.read<HomeBloc>().add(
                                    HomeEvent.changeActiveStatus(
                                      status: value,
                                      providerID: user.uuid,
                                    ),
                                  );
                            },
                          ),
                          loading: (_) => const Loading(),
                          changeActiveStatusSuccess: (data) => FlutterSwitch(
                            value: data.status,
                            width: 45,
                            height: 25,
                            activeColor:
                                Theme.of(context).colorScheme.inversePrimary,
                            inactiveColor:
                                Theme.of(context).colorScheme.outline,
                            onToggle: (value) {
                              context.read<HomeBloc>().add(
                                    HomeEvent.changeActiveStatus(
                                      status: value,
                                      providerID: data.user.uuid,
                                    ),
                                  );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  AutoSizeText(
                    l10n.recentOrdersLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 32),
                  state.maybeWhen(
                    orElse: () => Container(
                      height: 140,
                      color: Theme.of(context).colorScheme.tertiary,
                      alignment: Alignment.center,
                      child: AutoSizeText(l10n.emptyLabel),
                    ),
                    loaded: (user, homeModel, listService, ads) {
                      return Container(
                        height: 140,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(48),
                                          child: CachedNetworkImage(
                                            fadeInDuration: const Duration(
                                              milliseconds: 50,
                                            ),
                                            fadeOutDuration: const Duration(
                                              milliseconds: 50,
                                            ),
                                            imageUrl: homeModel.imageUrl,
                                            placeholder: (context, url) {
                                              return DefaultAvatar(
                                                textSize: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                                userName:
                                                    homeModel.providerName,
                                              );
                                            },
                                            errorWidget:
                                                (context, url, dynamic error) {
                                              return DefaultAvatar(
                                                textSize: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge,
                                                userName:
                                                    homeModel.providerName,
                                              );
                                            },
                                            height: 64,
                                            width: 64,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            10,
                                            0,
                                            0,
                                          ),
                                          child: AutoSizeText(
                                            homeModel.providerName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      AutoSizeText(
                                        '''${l10n.vehicleTypeLabel}: ${homeModel.serviceType == 0 ? l10n.motorcycleLabel : l10n.carLabel}''',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      AutoSizeText(
                                        '${l10n.dayLabel}: ${context.formatDate(
                                          homeModel.created,
                                        )}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: Column(
                                  children: [
                                    RatingBar.builder(
                                      initialRating:
                                          homeModel.rating.toDouble(),
                                      itemSize: 30,
                                      ignoreGestures: true,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                      ),
                                      onRatingUpdate: print,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  AutoSizeText(
                    l10n.discoverNowLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  state.maybeWhen(
                    orElse: () => Container(
                      height: 140,
                      alignment: Alignment.center,
                      child: AutoSizeText(l10n.emptyLabel),
                    ),
                    initial: (ads) => Swiper(
                      autoplay: true,
                      layout: SwiperLayout.STACK,
                      itemCount: ads.length(),
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: ads.get(index).getOrElse(
                                () =>
                                    'https://www.tiendauroi.com/wp-content/uploads/2020/02/shopee-freeship-xtra-750x233.jpg',
                              ),
                        );
                      },
                      itemWidth: 400,
                      itemHeight: 140,
                    ),
                    recentOrderEmpty: (aS, listService, ads) => Swiper(
                      autoplay: true,
                      layout: SwiperLayout.STACK,
                      itemCount: ads.length(),
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: ads.get(index).getOrElse(
                                () =>
                                    'https://www.tiendauroi.com/wp-content/uploads/2020/02/shopee-freeship-xtra-750x233.jpg',
                              ),
                        );
                      },
                      itemWidth: 400,
                      itemHeight: 140,
                    ),
                    loaded: (user, recentOrder, listService, ads) => Swiper(
                      autoplay: true,
                      layout: SwiperLayout.STACK,
                      itemCount: ads.length(),
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: ads.get(index).getOrElse(
                                () =>
                                    'https://www.tiendauroi.com/wp-content/uploads/2020/02/shopee-freeship-xtra-750x233.jpg',
                              ),
                        );
                      },
                      itemWidth: 400,
                      itemHeight: 140,
                    ),
                  ),
                  const SizedBox(height: 32),
                  AutoSizeText(
                    l10n.serviceAccountLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  state.maybeWhen(
                    orElse: () => Container(
                      height: 140,
                      color: Theme.of(context).colorScheme.tertiary,
                      alignment: Alignment.center,
                      child: AutoSizeText(l10n.emptyLabel),
                    ),
                    loaded: (user, recentOrder, listService, ads) => listService
                            .isNotEmpty
                        ? Swiper(
                            autoplay: true,
                            duration: 500,
                            layout: SwiperLayout.STACK,
                            itemCount:
                                listService.length > 5 ? 5 : listService.length,
                            itemBuilder: (context, index) {
                              return CartService(
                                isActive: listService[index].isActive,
                                imgUrl: listService[index].imgUrl,
                                serviceName: listService[index].name,
                                priceRange:
                                    context.formatMoney(listService[index].fee),
                                callback: () {
                                  context.router.push(
                                    ListServiceRoute(
                                      providerID: getUser(
                                        context.read<AuthenticateBloc>().state,
                                      )
                                          .getOrElse(
                                              () => throw NullThrownError())
                                          .uuid,
                                    ),
                                  );
                                },
                              );
                            },
                            itemWidth: 400,
                            itemHeight: 140,
                          )
                        : Container(
                            height: 140,
                            color: Theme.of(context).colorScheme.tertiary,
                            alignment: Alignment.center,
                            child: AutoSizeText(l10n.emptyLabel),
                          ),
                    recentOrderEmpty: (aS, listService, ads) => listService
                            .isNotEmpty
                        ? Swiper(
                            autoplay: true,
                            layout: SwiperLayout.STACK,
                            itemCount:
                                listService.length > 5 ? 5 : listService.length,
                            itemBuilder: (context, index) {
                              return CartService(
                                isActive: listService[index].isActive,
                                imgUrl: listService[index].imgUrl,
                                serviceName: listService[index].name,
                                priceRange:
                                    context.formatMoney(listService[index].fee),
                                callback: () {
                                  context.router.push(
                                    ListServiceRoute(
                                      providerID: getUser(
                                        context.read<AuthenticateBloc>().state,
                                      )
                                          .getOrElse(
                                              () => throw NullThrownError())
                                          .uuid,
                                    ),
                                  );
                                },
                              );
                            },
                            itemWidth: 400,
                            itemHeight: 140,
                          )
                        : Container(
                            height: 140,
                            color: Theme.of(context).colorScheme.tertiary,
                            alignment: Alignment.center,
                            child: AutoSizeText(l10n.emptyLabel),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
