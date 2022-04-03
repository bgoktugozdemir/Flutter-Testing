import 'package:flutter/material.dart';
import 'package:flutter_testing/core/models/models.dart';

class UserDetailLoaded extends StatelessWidget {
  const UserDetailLoaded({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Bio(user: user),
        AddressSection(address: user.address),
        CompanySection(company: user.company),
      ],
    );
  }
}

@visibleForTesting
class Bio extends StatelessWidget {
  const Bio({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.15,
          child: Text(
            '${user.id}',
            style: textTheme.headline3!.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 6),
        BioInfo(
          info: user.name,
          style: textTheme.headline6,
        ),
        const SizedBox(height: 6),
        BioInfo(
          info: '@${user.username}',
          style: textTheme.subtitle1,
        ),
        const SizedBox(height: 2),
        BioInfo(
          info: user.email,
        ),
        BioInfo(
          info: user.phone,
        ),
        BioInfo(
          info: user.website,
        ),
      ],
    );
  }
}

@visibleForTesting
class BioInfo extends StatelessWidget {
  const BioInfo({
    Key? key,
    required this.info,
    this.style,
    this.onTap,
  }) : super(key: key);

  final String info;
  final TextStyle? style;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          info,
          textAlign: TextAlign.center,
          style: style ?? Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

@visibleForTesting
class AddressSection extends StatelessWidget {
  const AddressSection({Key? key, required this.address}) : super(key: key);

  final Address address;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionHeader('Address'),
        UserInfoBar(title: 'Address', info: address.fullAddress),
        UserInfoBar(title: 'Coordinates', info: address.geo.coordinates),
      ],
    );
  }
}

@visibleForTesting
class CompanySection extends StatelessWidget {
  const CompanySection({Key? key, required this.company}) : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader('Company'),
        UserInfoBar(title: 'Name', info: company.name),
        UserInfoBar(title: 'Catch Phrase', info: company.catchPhrase),
        UserInfoBar(title: 'BS', info: company.bs),
      ],
    );
  }
}

@visibleForTesting
class SectionHeader extends StatelessWidget {
  const SectionHeader(this.header, {Key? key}) : super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(thickness: 1),
          Text(
            header,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
class UserInfoBar extends StatelessWidget {
  const UserInfoBar({
    Key? key,
    required this.title,
    required this.info,
  })  : assert(info != null),
        super(key: key);

  final String title;
  final dynamic info;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '$title:',
            style: textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            '$info',
            style: textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
