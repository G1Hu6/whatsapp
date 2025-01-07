import 'package:flutter/material.dart';
import 'package:whatsapp_ui/widgets/contacts_list.dart';
import 'package:whatsapp_ui/widgets/custom_text_field.dart';
import 'package:chips_choice/chips_choice.dart';

List<String> options = [
  'All',
  'Unread',
  'Favourites',
  'Grpups',
  ' + ',
];

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            hintText: "Search...",
            validator: (value) {
              return null;
            },
            onSaved: (p0) {},
            prefixIcon: const Icon(
              Icons.search,
              color: Color.fromARGB(212, 151, 165, 163),
            ),
          ),
          ChipsChoice<int>.single(
            
            value: 1,
            onChanged: (val) {},
            choiceItems: C2Choice.listFrom<int, String>(
              style: (index, item) {
                return null;
              
               
              },
              source: options,
              value: (i, v) => i,
              label: (i, v) => v,
            ),
          ),
          const ContactsList(),
        ],
      ),
    );
  }
}
