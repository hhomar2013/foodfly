part of 'onboarding_cubit.dart';

sealed class OnboardingState {}
class OnboardingInitial extends OnboardingState {}
class OnboardingLoading extends OnboardingState {}
class OnboardingSuccess extends OnboardingState {}
class OnboardingFailure extends OnboardingState{}