import 'package:ekarma/configs/app_assets.dart';
import 'package:ekarma/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ekarma/core/routes/paths.dart' as path;

class JobWidget extends StatelessWidget {

  const JobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('Toilet Cleaner', style: Theme.of(context).textTheme.titleSmall),
                    Row(
                      children: [
                        Text('Kathmandu', style: Theme.of(context).textTheme.bodySmall),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.circle, color: Colors.black54, size: 8,),
                        ),
                        Text('24 Jan 2024', style: Theme.of(context).textTheme.bodySmall),
                      ],
                    )
                  ],
                ),

                Image.asset(AppAssets.saveIcon, height: MediaQuery.of(context).size.height*0.03,),

              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.02),

            Text(
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,'
                  'totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae '
                  'dicta sunt explicabo.',
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 3,
            ),

            InkWell(
              onTap: (){
                context.go(path.singleJob);
              },
              child: Text(
                'view more...',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.primaryColor),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height*0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Part Time', style: Theme.of(context).textTheme.bodySmall,),
                        ),
                      ),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('No Experience', style: Theme.of(context).textTheme.bodySmall,),
                      ),
                    ),

                  ],
                ),


                Text('Rs. 3480', style: Theme.of(context).textTheme.titleSmall),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
