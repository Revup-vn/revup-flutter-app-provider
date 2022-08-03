import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../widgets/base_textfield.u.dart';

class AddService extends StatelessWidget {
  const AddService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final priceController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          'Thêm mới dịch vụ',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Ảnh dịch vụ',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: const Color(0xFFA8A6A9)),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    height: 96,
                    width: 96,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.add_photo_alternate_outlined),
                  ),
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Thông tin dịch vụ',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: const Color(0xFFA8A6A9)),
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Tên dịch vụ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                BaseTextField(
                  controller: nameController,
                  hintText: 'Nhập tên dịch vụ',
                  borderType: BorderType.OUTLINE,
                  onChange: (value) {},
                  suffixIcon: nameController.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: const Icon(Icons.clear_outlined),
                            onPressed: () {},
                          ),
                        )
                      : null,
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Tiền công dịch vụ',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                BaseTextField(
                  controller: priceController,
                  hintText: 'Nhập số tiền',
                  borderType: BorderType.OUTLINE,
                  onChange: (value) {},
                  suffixIcon: priceController.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: const Icon(Icons.clear_outlined),
                            onPressed: () {},
                          ),
                        )
                      : null,
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Đơn vị tính giá',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                    //value: value,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: '1',
                        child: Text('Cái'),
                      ),
                      DropdownMenuItem(
                        value: '2',
                        child: Text('Hộp'),
                      ),
                    ],
                    onChanged: null,
                  ),
                ),
                const SizedBox(height: 10),
                AutoSizeText(
                  'Mô tả (tối đá 100 ký tự)',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: 5),
                BaseTextField(
                  controller: descriptionController,
                  hintText: 'Nhập mô tả ngắn',
                  borderType: BorderType.OUTLINE,
                  minLines: 3,
                  maxLines: 3,
                  onChange: (value) {},
                  suffixIcon: descriptionController.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            icon: const Icon(Icons.clear_outlined),
                            onPressed: () {},
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
