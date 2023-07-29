import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_but_threads/features/auth/controller/auth_controller.dart';
import 'package:twitter_but_threads/theme/pallete.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(userProvider);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          //USER INFO
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currentUser!.username,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white10,
                        shape: BoxShape.circle,
                      ),
                      child: currentUser.profilePic.isEmpty
                          ? const ImageIcon(
                              AssetImage("assets/icons/profile.png"))
                          : ClipRRect(
                              child: Image.network(currentUser.profilePic)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(currentUser.bio),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "${currentUser.following.length} Following",
                      style: const TextStyle(color: Pallete.greyColor),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${currentUser.followers.length} Followers",
                      style: const TextStyle(color: Pallete.greyColor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Pallete.greyColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    ref
                        .read(authControllerProvider.notifier)
                        .updateUserData(currentUser.uid);
                  },
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Pallete.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
