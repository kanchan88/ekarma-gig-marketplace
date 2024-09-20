import 'package:ekarma/configs/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ekarma/core/routes/paths.dart' as path;

class SingleJobScreen extends StatefulWidget {

  const SingleJobScreen({Key? key}):super(key: key);

  @override
  State<SingleJobScreen> createState() => _SingleJobScreenState();
}

class _SingleJobScreenState extends State<SingleJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        leading: IconButton(
          onPressed: (){
            context.go(path.workerHome);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Job Details', style: Theme.of(context).textTheme.titleSmall),
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: MediaQuery.of(context).size.height*0.16,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Icon(Icons.circle, color: Colors.black54, size: 8,),
                                    ),
                                    Text('Full Time', style: Theme.of(context).textTheme.bodySmall),
                                  ],
                                ),

                                const SizedBox(height: 10.0,),

                                RichText(
                                  text: TextSpan(
                                    text: 'Estimated Pay ',
                                    style: Theme.of(context).textTheme.bodySmall,
                                    children: <TextSpan>[
                                      TextSpan(text: "Rs. 4500", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600, fontSize: 14.0)),
                                    ],
                                  ),
                                ),

                              ],
                            ),


                          ],
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*0.02),

                      ],
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.03),

                Text('Job Description', style: Theme.of(context).textTheme.titleSmall),

                SizedBox(height: MediaQuery.of(context).size.height*0.01),

                Text(
                    'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,'
                    'totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta '
                    'sunt explicabo. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque'
                    'laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae'
                    'itae dicta sunt explicabo.',
                    style: Theme.of(context).textTheme.bodySmall,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
