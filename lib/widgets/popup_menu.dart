import 'package:flutter/material.dart';
import 'package:tasks_app/models/tasks.dart';
//https://youtu.be/PD0eAXLd5ls?t=6549

class PopupMenu extends StatelessWidget {
  final VoidCallback cancelOrDeleteCallback;
  //https://youtu.be/PD0eAXLd5ls?t=6899
  //!favoriate is not working https://youtu.be/PD0eAXLd5ls?t=6882
  final VoidCallback likeOrDislikeCallback;
  // /https://youtu.be/PD0eAXLd5ls?t=7225
  //!edit button doesn't work- doesn't save
  final VoidCallback editTalkCallback;
  //https://youtu.be/PD0eAXLd5ls?t=7435
  final VoidCallback restoreTalkCallback;
  final Task task;

  const PopupMenu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.task,
    required this.likeOrDislikeCallback,
    // /https://youtu.be/PD0eAXLd5ls?t=7225
    required this.editTalkCallback,
    required this.restoreTalkCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        //https://youtu.be/PD0eAXLd5ls?t=6610
        itemBuilder: task.isDeleted == false
            ? ((context) => [
                  PopupMenuItem(
                    //https://youtu.be/PD0eAXLd5ls?t=7295
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                      onPressed: editTalkCallback,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                    onTap: null,
                  ),
                  PopupMenuItem(
                    onTap: null,
                    child: TextButton.icon(
                      onPressed: likeOrDislikeCallback,
                      //https://youtu.be/PD0eAXLd5ls?t=6899
                      icon: task.isFavorite == false
                          ? const Icon(Icons.bookmark_add_outlined)
                          : const Icon(Icons.bookmark_remove),
                      label: task.isFavorite == false
                          ? const Text('Add to \nfavorite')
                          : const Text('Remove from \nbookmark'),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete'),
                    ), //() => _removeOrDeleteTasks(context, task),
                  )
                ])
            : (context) => [
                  PopupMenuItem(
                    // ignore: sort_child_properties_last
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text('Restore'),
                    ),
                    onTap: restoreTalkCallback,
                  ),
                  PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text('Delete'),
                    ),
                  ),
                ]);
  }
}
