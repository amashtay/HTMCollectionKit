//
//  ReviewsService.swift
//  HTMCollectionKit
//
//  Created by amashtay on 10.07.2025.
//  Copyright © 2025 CocoaPods. All rights reserved.
//

import Foundation

final class ReviewsService: ReviewsServiceProtocol {
    func loadReviews() async -> [Review] {
        [
            Review(
                title: "Lorem ipsum dolor sit amet",
                text:
                    """
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.
                    """
            ),
            //            Review(
            //                title: "Sed ut perspiciatis unde omnis iste natus",
            //                text:
            //                    """
            //                    Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam,
            //                    nisi ut aliquid ex ea commodi consequatur?
            //                    Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur?
            //                    Vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
            //                    """
            //            ),
            //            Review(
            //                title: "At vero eos et accusamus et iusto odio",
            //                text:
            //                    """
            //                    At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum
            //                    deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non
            //                    provident. Similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.
            //                    """
            //            ),
            //            Review(
            //                title: "Et harum quidem rerum facilis est et expedita",
            //                text:
            //                    """
            //                    Et harum quidem rerum facilis est et expedita distinctio.
            //                    """
            //            ),
            //            Review(
            //                title: "Temporibus autem quibusdam et aut officiis",
            //                text:
            //                    """
            //                    Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et
            //                    voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente
            //                    delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis
            //                    doloribus asperiores repellat.
            //                    """
            //            ),
        ]
    }
        
    func updateReviews() async -> [Review] {
        [Review(
            title: "Sed ut perspiciatis unde omnis iste natus",
            text:
                    """
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                    Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.
                    Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam,
                    nisi ut aliquid ex ea commodi consequatur?
                    Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur?
                    Vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
                    """
        )]
    }
}
